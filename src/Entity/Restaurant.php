<?php

namespace App\Entity;

use App\Repository\RestaurantRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=RestaurantRepository::class)
 */
class Restaurant
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
     * @ORM\Column(type="string", length=255)
     */
    private $TelefonNr;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $Mobil;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $Straße;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $HausNr;

    /**
     * @ORM\OneToMany(targetEntity=Gericht::class, mappedBy="restaurant")
     */
    private $Gerichte;

    /**
     * @ORM\OneToMany(targetEntity=Kategorie::class, mappedBy="Restaurant")
     */
    private $kategories;


    public function __construct()
    {
        $this->Gerichte = new ArrayCollection();
        $this->kategories = new ArrayCollection();
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

    public function getTelefonNr(): ?string
    {
        return $this->TelefonNr;
    }

    public function setTelefonNr(string $TelefonNr): self
    {
        $this->TelefonNr = $TelefonNr;

        return $this;
    }

    public function getMobil(): ?string
    {
        return $this->Mobil;
    }

    public function setMobil(?string $Mobil): self
    {
        $this->Mobil = $Mobil;

        return $this;
    }

    public function getStraße(): ?string
    {
        return $this->Straße;
    }

    public function setStraße(string $Straße): self
    {
        $this->Straße = $Straße;

        return $this;
    }

    public function getHausNr(): ?string
    {
        return $this->HausNr;
    }

    public function setHausNr(string $HausNr): self
    {
        $this->HausNr = $HausNr;

        return $this;
    }

    /**
     * @return Collection|Gericht[]
     */
    public function getGerichte(): Collection
    {
        return $this->Gerichte;
    }

    public function addGerichte(Gericht $gerichte): self
    {
        if (!$this->Gerichte->contains($gerichte)) {
            $this->Gerichte[] = $gerichte;
            $gerichte->setRestaurant($this);
        }

        return $this;
    }

    public function removeGerichte(Gericht $gerichte): self
    {
        if ($this->Gerichte->removeElement($gerichte)) {
            // set the owning side to null (unless already changed)
            if ($gerichte->getRestaurant() === $this) {
                $gerichte->setRestaurant(null);
            }
        }

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
            $kategory->setRestaurant($this);
        }

        return $this;
    }

    public function removeKategory(Kategorie $kategory): self
    {
        if ($this->kategories->removeElement($kategory)) {
            // set the owning side to null (unless already changed)
            if ($kategory->getRestaurant() === $this) {
                $kategory->setRestaurant(null);
            }
        }

        return $this;
    }
}
