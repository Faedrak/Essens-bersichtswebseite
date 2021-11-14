<?php

namespace App\Controller;

use App\Entity\Restaurant;
use App\Entity\SammelBestellung;
use Doctrine\ORM\PersistentCollection;
use phpDocumentor\Reflection\Types\Boolean;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;
use function Symfony\Component\Translation\t;

/**
 * Class HomeController
 * Startklasse der Webseite.
 * @package App\Controller
 */
class HomeController extends AbstractController
{
    /**
     * ## Index Funktion
     * @param SessionInterface $session Eine Service Injektion für das Management von den PHP Session
     * @return Response
     */
    #[Route('/', name: 'home')]
    public function index(SessionInterface $session): Response
    {
        $restaurants = $this->getDoctrine()
        ->getRepository(Restaurant::class)->findAll();

        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'restaurants' => $restaurants
        ]);
    }

    #[Route('/gerichte/{id}', name: 'gerichte')]
    public function gerichte(int $id, SessionInterface $session): Response
    {
        $restaurant = $this->getDoctrine()->getRepository(Restaurant::class)->findOneBy(['id' => $id]);
        $gerichte = $restaurant->getGerichte();

        return $this->render('home/gerichte.html.twig', [
            'restaurant' => $restaurant,
            'gerichte' => $gerichte,
            'inOrderMode' => false
        ]);
    }

    #[Route('/order/{restaurantID}', name: "order")]
    public function Order(int $restaurantID): Response
    {
        $restaurant = $this->getDoctrine()->getRepository(Restaurant::class)->findOneBy(['id' => $restaurantID]);
        $gerichte = $restaurant->getGerichte();

        return $this->render('home/gerichte.html.twig', [
            'restaurant' => $restaurant,
            'gerichte' => $gerichte,
            'inOrderMode' => true
        ]);
    }
}
