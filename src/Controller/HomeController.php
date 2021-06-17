<?php

namespace App\Controller;


use App\Entity\Restaurant;
use Doctrine\ORM\PersistentCollection;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * Das ist ein Test
     * @param SessionInterface $session Eine Service Injektion für das Management von den PHP Session
     * @return Response
     */
    #[Route('/', name: 'home')]
    public function index(SessionInterface $session): Response
    {
        $restaurants = $this->getDoctrine()
        ->getRepository(Restaurant::class)->findAll();




        $session->set('foo', 'bar');

        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'restaurants' => $restaurants
        ]);



    }

    #[Route('/gerichte/{id}', name: 'gerichte')]
    public function gerichte(int $id, SessionInterface $session) : Response
    {
//        $restaurant = $this->getDoctrine()->getRepository(Restaurant::class)->findOneBy(['id' => $id]);
        
        $gericht = null;


        dump($gericht);
        return $this->render('home/gerichte.html.twig', [
            'gerichte' => $gericht
        ]);
    }


}
