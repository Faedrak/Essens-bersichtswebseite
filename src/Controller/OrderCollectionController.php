<?php

namespace App\Controller;


use App\Entity\Restaurant;
use Doctrine\ORM\PersistentCollection;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

class OrderCollectionController extends AbstractController
{
    /**
     * Das ist ein Test
     * @param SessionInterface $session Eine Service Injektion für das Management von den PHP Session
     * @return Response
     */
    #[Route('/ordercollection', name: 'ordercollection')]
    public function index(SessionInterface $session): Response
    {
        $restaurants = $this->getDoctrine()
        ->getRepository(Restaurant::class)->findAll();

        $session->set('foo', 'bar');

        return $this->render('ordercollection/ordercollection.html.twig', [
            'controller_name' => 'OrderCollectionController'
        ]);



    }
}
