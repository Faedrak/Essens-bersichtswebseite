<?php

namespace App\Entity;

use App\Repository\GerichtRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=GerichtRepository::class)
 */
class Gericht
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $Name;

    /**
     * @ORM\Column(type="text")
     */
    private $Beschreibung;

    /**
     * @ORM\ManyToOne(targetEntity=Restaurant::class, inversedBy="Gerichte")
     * @ORM\JoinColumn(nullable=false)
     */
    private $Restaurant;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->Name;
    }

    public function setName(string $Name): self
    {
        $this->Name = $Name;

        return $this;
    }

    public function getBeschreibung(): ?string
    {
        return $this->Beschreibung;
    }

    public function setBeschreibung(string $Beschreibung): self
    {
        $this->Beschreibung = $Beschreibung;

        return $this;
    }

    public function getRestaurant(): ?Restaurant
    {
        return $this->Restaurant;
    }

    public function setRestaurant(?Restaurant $Restaurant): self
    {
        $this->Restaurant = $Restaurant;

        return $this;
    }
}
