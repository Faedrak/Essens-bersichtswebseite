<?php

namespace App\Controller;


use App\Entity\Restaurant;
use App\Entity\SammelBestellung;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\PersistentCollection;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\BrowserKit\Request;
use Symfony\Component\HttpFoundation\Request as HttpFoundationRequest;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class OrderCollectionController extends AbstractController
{
    /**
     * Das ist ein Test
     * @param SessionInterface $session Eine Service Injektion für das Management von den PHP Session
     * @return Response
     */
    #[Route('/ordercollection/', name: 'ordercollection')]
    public function index(SessionInterface $session): Response
    {
        $restaurants = $this->getDoctrine()
        ->getRepository(Restaurant::class)->findAll();
        
        $session->set('foo', 'bar');


        return $this->render('ordercollection/create.html.twig', [
            'controller_name' => 'OrderCollectionController',
            'restaurants' => $restaurants
        ]);

    }

    #[Route('/ordercollection/new/{id}', name: 'new')]
    public function new(int $id, SessionInterface $session)
    {
        if($session->get('sammelbestellung') != null){
            return $this->render('ordercollection/receivedurls.html.twig', [
                'controller_name' => 'OrderCollectionController',
                'sammelbestellung' => $session->get('sammelbestellung')
            ]);
        }


       $restaurant = $this->getDoctrine()->getRepository(Restaurant::class)->find($id); 

       $sammelbestellung = new SammelBestellung();
       $sammelbestellung->setRestaurant($restaurant);
       $sammelbestellung->setPublicURL(bin2hex(openssl_random_pseudo_bytes(16)));
       $sammelbestellung->setAdminURL(bin2hex(openssl_random_pseudo_bytes(16)));


       $em = $this->getDoctrine()->getManager();
       $em->persist($restaurant);
       $em->persist($sammelbestellung);
       $session->set('sammelbestellung', $sammelbestellung);
       $em->flush();

        return $this->render('ordercollection/receivedurls.html.twig', [
            'controller_name' => 'OrderCollectionController',
            'sammelbestellung' => $sammelbestellung
        ]);
    }

    #[Route('/ordercollection/pub/{link}', name: 'setParam')]
    public function setSessionParam(SessionInterface $session, string $link)
    {
        $sammelbestellung = $this->getDoctrine()->getRepository(SammelBestellung::class)->findOneBy(['PublicURL' => $link]);
        if($sammelbestellung instanceof SammelBestellung){
             $id = $sammelbestellung->getRestaurant()->getId();
            $session->set('pubLink', $link);
            return $this->forward('App\Controller\HomeController::gerichte', array('id' => $id, 'orderEnabled' => true));
        }
    }

    // #[Route('/ordercollection/admin/{link}', name: 'setAdmin')]
    // public function setSessionParam(SessionsInterface){

    // }

}