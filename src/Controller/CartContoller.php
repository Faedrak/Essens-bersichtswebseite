<?php

namespace App\Controller;

use App\Entity\Bestellung;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\SammelBestellung;
use App\Entity\Restaurant;
use PhpParser\Node\Name;

class CartContoller extends AbstractController
{
    #[Route('/cart', name: 'cart')]
    public function index(): Response
    {
        $sammelBestellungID=1;
        $sammel_bestellung=$this->getDoctrine()->getRepository(SammelBestellung::class)->find($sammelBestellungID);
        $restaurant_name=$sammel_bestellung->getRestaurant()->getName();
        $bestellungen=$sammel_bestellung->getBestellung();
        
       


        return $this->render('cart/cart.html.twig', [
            'restaurant_name' => $restaurant_name,
            'bestellungen'=> $bestellungen

        ]);
    }

    #[Route('/card/add', name: 'addItemToCart')]
    public function addItem(Request $request){
        $publicURL = $request->get('cardItem');

        return new Response($publicURL);

    }

}

/*

 foreach ($sammel_bestellung->getBestellung() as $bestellung){
            dump($bestellung->getGastName());
        }


        $array = array('test');

        array_push($array, "value");

        array_push($array, array('wert' => 'value'));

        return new Response(json_encode($array));

        $array2 = [
            'foo' => 'bar'
        ];

        $array = array("test", "test2");
*/