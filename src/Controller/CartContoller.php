<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CartContoller extends AbstractController
{
    #[Route('/cart', name: 'cart')]
    public function index(): Response
    {
        

        return $this->render('cart/cart.html.twig', [
            //'aktuelleZeiteinfach' => date("Y"),,

        ]);
    }

}
