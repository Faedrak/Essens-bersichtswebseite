<?php

namespace App\Controller;

use App\Entity\Bestellung;
use App\Entity\GerichtVariation;
use SebastianBergmann\GlobalState\ExcludeList;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
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
        $restaurant = null;
        $bestellungen = null;

        if ($session->get('bestellID') != null) {
            $sammel_bestellung = $this->getDoctrine()->getRepository(Bestellung::class)->find($session->get('bestellID'))->getSammelBestellung();

            $restaurant=$sammel_bestellung->getRestaurant();
            $bestellungen=$sammel_bestellung->getBestellung();
        }

        return $this->render('cart/cart.html.twig', [
            'restaurant' => $restaurant,
            'bestellungen'=> $bestellungen

        ]);
    }

    #[Route('/cart/remove/{id}', name: 'rmItemfromCart')]
    public function rmItem(int $id, SessionInterface $session): RedirectResponse
    {
        $bestellid=$session->get('bestellID');
        $bestellung=$this->getDoctrine()->getRepository(Bestellung::class)->find($bestellid);
        foreach ($bestellung->getGerichtVariation() as $gerichtvari) {
            if ($gerichtvari->getId()==$id) {
                $bestellung->removeGerichtVariation($gerichtvari);
            }
        }
        $em = $this->getDoctrine()->getManager();
        $em->flush();




        return $this->redirectToRoute('cart');
    }

    #[Route('/card/add', name: 'addItemToCart')]
    public function addItem(Request $request, SessionInterface $session): RedirectResponse
    {
        $gvID = $request->get('cardItem');

        $gerichtVari = $this->getDoctrine()->getRepository(GerichtVariation::class)->find($gvID);

        $bestellung = $this->getDoctrine()->getRepository(Bestellung::class)->find($session->get('bestellID'));

        $bestellung->addGerichtVariation($gerichtVari);
        $em = $this->getDoctrine()->getManager();
        $em->persist($bestellung);
        $em->flush();

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
