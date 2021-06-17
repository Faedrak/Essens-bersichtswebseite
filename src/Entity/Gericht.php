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
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $Nummer;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $Beschreibung;

    /**
     * @ORM\ManyToOne(targetEntity=Restaurant::class, inversedBy="Gerichte")
     * @ORM\JoinColumn(nullable=false)
     */
    private $Restaurant;

    /**
     * @ORM\ManyToOne(targetEntity=Kategorie::class, inversedBy="Gerichte")
     */
    private $Kategorie;

    /**
     * @ORM\OneToMany(targetEntity=GerichtVariation::class, mappedBy="gericht")
     */
    private $GerichtVariationen;

    public function __construct()
    {
        $this->GerichtVariationen = new ArrayCollection();
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

    public function getNummer(): ?string
    {
        return $this->Nummer;
    }

    public function setNummer(?string $Nummer): self
    {
        $this->Nummer = $Nummer;

        return $this;
    }

    public function getBeschreibung(): ?string
    {
        return $this->Beschreibung;
    }

    public function setBeschreibung(?string $Beschreibung): self
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

    public function getKategorie(): ?Kategorie
    {
        return $this->Kategorie;
    }

    public function setKategorie(?Kategorie $Kategorie): self
    {
        $this->Kategorie = $Kategorie;

        return $this;
    }

    /**
     * @return Collection|GerichtVariation[]
     */
    public function getGerichtVariationen(): Collection
    {
        return $this->GerichtVariationen;
    }

    public function addGerichtVariationen(GerichtVariation $gerichtVariationen): self
    {
        if (!$this->GerichtVariationen->contains($gerichtVariationen)) {
            $this->GerichtVariationen[] = $gerichtVariationen;
            $gerichtVariationen->setGericht($this);
        }

        return $this;
    }

    public function removeGerichtVariationen(GerichtVariation $gerichtVariationen): self
    {
        if ($this->GerichtVariationen->removeElement($gerichtVariationen)) {
            // set the owning side to null (unless already changed)
            if ($gerichtVariationen->getGericht() === $this) {
                $gerichtVariationen->setGericht(null);
            }
        }

        return $this;
    }
}
