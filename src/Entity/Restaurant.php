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
     * @ORM\ManyToOne(targetEntity=Ort::class, inversedBy="restaurants")
     */
    private $Ort;

    /**
     * @ORM\Column(type="json", nullable=true)
     */
    private $Oeffnungszeit = [];

    /**
     * @ORM\OneToMany(targetEntity=Gericht::class, mappedBy="Restaurant")
     */
    private $Gerichte;

    /**
     * @ORM\OneToMany(targetEntity=SammelBestellung::class, mappedBy="Restaurant")
     */
    private $SammelBestellungen;

    public function __construct()
    {
        $this->Gerichte = new ArrayCollection();
        $this->SammelBestellungen = new ArrayCollection();
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

    public function getOrt(): ?Ort
    {
        return $this->Ort;
    }

    public function setOrt(?Ort $Ort): self
    {
        $this->Ort = $Ort;

        return $this;
    }

    public function getOeffnungszeit(): ?array
    {
        return $this->Oeffnungszeit;
    }

    public function setOeffnungszeit(?array $Oeffnungszeit): self
    {
        $this->Oeffnungszeit = $Oeffnungszeit;

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
     * @return Collection|SammelBestellung[]
     */
    public function getSammelBestellungen(): Collection
    {
        return $this->SammelBestellungen;
    }

    public function addSammelBestellungen(SammelBestellung $sammelBestellungen): self
    {
        if (!$this->SammelBestellungen->contains($sammelBestellungen)) {
            $this->SammelBestellungen[] = $sammelBestellungen;
            $sammelBestellungen->setRestaurant($this);
        }

        return $this;
    }

    public function removeSammelBestellungen(SammelBestellung $sammelBestellungen): self
    {
        if ($this->SammelBestellungen->removeElement($sammelBestellungen)) {
            // set the owning side to null (unless already changed)
            if ($sammelBestellungen->getRestaurant() === $this) {
                $sammelBestellungen->setRestaurant(null);
            }
        }

        return $this;
    }
}
