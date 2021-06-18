<?php

namespace App\Controller;


use App\Entity\Bestellung;
use App\Entity\Restaurant;
use App\Entity\SammelBestellung;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\PersistentCollection;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
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
    

        return $this->render('ordercollection/create.html.twig', [
            'controller_name' => 'OrderCollectionController',
            'restaurants' => $restaurants
        ]);

    }

    #[Route('/ordercollection/new/{id}', name: 'new')]
    public function new(int $id, SessionInterface $session)
    {

       $restaurant = $this->getDoctrine()->getRepository(Restaurant::class)->find($id); 

       $sammelbestellung = new SammelBestellung();
       $sammelbestellung->setRestaurant($restaurant);
       $sammelbestellung->setPublicURL(bin2hex(openssl_random_pseudo_bytes(16)));
       $sammelbestellung->setAdminURL(bin2hex(openssl_random_pseudo_bytes(16)));


       $em = $this->getDoctrine()->getManager();
       $em->persist($restaurant);
       $em->persist($sammelbestellung);
       $em->flush();

    
       return $this->redirectToRoute('adminView', array('link' => $sammelbestellung->getAdminURL()));
    }

    #[Route('/ordercollection/admin/{link}', name: 'adminView')]
    public function adminView(string $link, SessionInterface $session)
    {
        $sammelbestellung = $this->getDoctrine()->getRepository(SammelBestellung::class)->findOneBy(['AdminURL' => $link]);

        return $this->render('ordercollection/adminView.html.twig', [
            'controller_name' => 'OrderCollectionController',
            'sammelbestellung' => $sammelbestellung
        ]);
    }

    #[Route('/ordercollection/pub/{link}', name: 'setParam')]
    public function setSessionParam(SessionInterface $session, string $link, Request $request)
    {
        if($request->get('Gast_Name') != null){
            $sammelbestellung = $this->getDoctrine()->getRepository(SammelBestellung::class)->findOneBy(['PublicURL' => $link]);

            $bestellung = new Bestellung();

            $bestellung->setGastName($request->get('Gast_Name'));
            $bestellung->setSammelBestellung($sammelbestellung);

            $em = $this->getDoctrine()->getManager();
            $em->persist($bestellung);
            $em->flush();

            $session->set('bestellID', $bestellung);

            if($sammelbestellung instanceof SammelBestellung){
                $id = $sammelbestellung->getRestaurant()->getId();
                $session->set('pubLink', $link);
                return $this->forward('App\Controller\HomeController::gerichte', array('id' => $id, 'publicId' => $link));
            }

        }

        return $this->render('ordercollection/guestname.html.twig', [
            'link' => $link
        ]);


    }

}
