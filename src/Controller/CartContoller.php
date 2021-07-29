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
    public function rmItem(int $id, SessionInterface $session): Response
    {
        $bestellid=$session->get('bestellID');
        $bestellung=$this->getDoctrine()->getRepository(Bestellung::class)->find($bestellid);

        if($this->checkOrderCollectionisOpen($bestellung->getSammelBestellung())){
            return $this->render('cart/ordercollectionClosed.html.twig');
        }


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
    public function addItem(Request $request, SessionInterface $session): Response
    {
        $gvID = $request->get('cardItem');

        $gerichtVari = $this->getDoctrine()->getRepository(GerichtVariation::class)->find($gvID);

        $bestellung = $this->getDoctrine()->getRepository(Bestellung::class)->find($session->get('bestellID'));

        if($this->checkOrderCollectionisOpen($bestellung->getSammelBestellung())){
            return $this->render('cart/ordercollectionClosed.html.twig');
        }


        $bestellung->addGerichtVariation($gerichtVari);
        $em = $this->getDoctrine()->getManager();
        $em->persist($bestellung);
        $em->flush();

        return $this->redirectToRoute('order', array('restaurantID' => $bestellung->getSammelBestellung()->getRestaurant()->getId()));
    }

    private function checkOrderCollectionisOpen(SammelBestellung $sammelBestellung){
        return !$sammelBestellung->getIstOffen();
    }



}

