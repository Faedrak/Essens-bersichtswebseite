<?php

namespace App\Entity;

use App\Repository\GerichtRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
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
     */
    private $restaurant;

    /**
     * @ORM\ManyToMany(targetEntity=Kategorie::class, mappedBy="Gerichte")
     */
    private $kategories;

    /**
     * @ORM\OneToMany(targetEntity=GerichtVariation::class, mappedBy="Gericht")
     */
    private $gerichtVariations;

    public function __construct()
    {
        $this->kategories = new ArrayCollection();
        $this->gerichtVariations = new ArrayCollection();
    }


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
        return $this->restaurant;
    }

    public function setRestaurant(?Restaurant $restaurant): self
    {
        $this->restaurant = $restaurant;

        return $this;
    }

    /**
     * @return Collection|Kategorie[]
     */
    public function getKategories(): Collection
    {
        return $this->kategories;
    }

    public function addKategory(Kategorie $kategory): self
    {
        if (!$this->kategories->contains($kategory)) {
            $this->kategories[] = $kategory;
            $kategory->addGerichte($this);
        }

        return $this;
    }

    public function removeKategory(Kategorie $kategory): self
    {
        if ($this->kategories->removeElement($kategory)) {
            $kategory->removeGerichte($this);
        }

        return $this;
    }

    /**
     * @return Collection|GerichtVariation[]
     */
    public function getGerichtVariations(): Collection
    {
        return $this->gerichtVariations;
    }

    public function addGerichtVariation(GerichtVariation $gerichtVariation): self
    {
        if (!$this->gerichtVariations->contains($gerichtVariation)) {
            $this->gerichtVariations[] = $gerichtVariation;
            $gerichtVariation->setGericht($this);
        }

        return $this;
    }

    public function removeGerichtVariation(GerichtVariation $gerichtVariation): self
    {
        if ($this->gerichtVariations->removeElement($gerichtVariation)) {
            // set the owning side to null (unless already changed)
            if ($gerichtVariation->getGericht() === $this) {
                $gerichtVariation->setGericht(null);
            }
        }

        return $this;
    }
}
