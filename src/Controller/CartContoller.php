<?php

namespace App\Controller;

use App\Entity\Bestellung;
use App\Entity\GerichtVariation;
use SebastianBergmann\GlobalState\ExcludeList;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\SammelBestellung;
use App\Entity\Restaurant;
use PhpParser\Node\Name;

class CartContoller extends AbstractController
{
    #[Route('/cart', name: 'cart')]
    public function index(SessionInterface $session): Response
    {
/*        $bestllungID =  $session->get('bestellID');
    
        
        $bestellungen = $this->getDoctrine()->getRepository(Bestellung::class)->find($bestllungID);


        $sammelBestellungID=$bestellungen->getSammelBestellung()->getId();
        $restaurants = $this->getDoctrine()->getRepository(Restaurant::class)->findAll();
        if(is_int($sammelBestellungID) != true){
            return $this->redirect('/');
        }

        $sammel_bestellung=$this->getDoctrine()->getRepository(SammelBestellung::class)->find($sammelBestellungID);*/


        $restaurant = null;
        $bestellungen = null;

        if($session->get('bestellID') != null){
            $sammel_bestellung = $this->getDoctrine()->getRepository(Bestellung::class)->find($session->get('bestellID'))->getSammelBestellung();

            $restaurant=$sammel_bestellung->getRestaurant();
            $bestellungen=$sammel_bestellung->getBestellung();
        }







        return $this->render('cart/cart.html.twig', [
            'restaurant' => $restaurant,
            'bestellungen'=> $bestellungen

        ]);
    }

    #[Route('/card/add', name: 'addItemToCart')]
    public function addItem(Request $request, SessionInterface $session){
        $gvID = $request->get('cardItem');



        $gerichtVari = $this->getDoctrine()->getRepository(GerichtVariation::class)->find($gvID);

        $bestellung = $this->getDoctrine()->getRepository(Bestellung::class)->find($session->get('bestellID'));


        $bestellung->addGerichtVariation($gerichtVari);
        $em = $this->getDoctrine()->getManager();
        $em->persist($bestellung);
        $em->flush();





        /*return $this->forward('App\Controller\HomeController::gerichte', array('id' => $restaurant->getID(), 'publicId' => $publicURL));*/
        return $this->redirectToRoute('order', array('restaurantID' => $bestellung->getSammelBestellung()->getRestaurant()->getId()));

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