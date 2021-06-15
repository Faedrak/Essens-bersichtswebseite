<?php

namespace App\Controller;

use App\Entity\Gericht;
use App\Entity\Restaurant;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(): Response
    {
        $restaurants = $this->getDoctrine()
        ->getRepository(Restaurant::class)->findAll();

        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'restaurants' => $restaurants
        ]);
    }

    #[Route('/gerichte/{id}', name: 'gerichte')]
    public function gerichte(int $id) : Response
    {
        $restaurant = $this->getDoctrine()->getRepository(Restaurant::class)->find($id);

        $gericht = null;



        if($restaurant instanceof Restaurant){
            $gericht = $restaurant->getGerichte();
        }

        dump($gericht);
        return $this->render('home/gerichte.html.twig', [
            'gerichte' => $gericht
        ]);
    }


}
