<?php

namespace App\Entity;

use App\Repository\GerichtVariationRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=GerichtVariationRepository::class)
 */
class GerichtVariation
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $Name;

    /**
     * @ORM\Column(type="boolean", options={"default" : 0})
     */
    private $isDefault;

    /**
     * @ORM\Column(type="decimal", precision=5, scale=2)
     */
    private $Preis;

    /**
     * @ORM\ManyToOne(targetEntity=Gericht::class, inversedBy="GerichtVariationen")
     * @ORM\JoinColumn(nullable=false)
     */
    private $gericht;

    /**
     * @ORM\ManyToMany(targetEntity=Bestellung::class, mappedBy="GerichtVariation")
     */
    private $Bestellungen;

    /**
     * @ORM\Column(type="boolean")
     */
    private $geloescht;

    public function __construct()
    {
        $this->Bestellungen = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->Name;
    }

    public function setName(?string $Name): self
    {
        $this->Name = $Name;

        return $this;
    }

    public function getIsDefault(): ?bool
    {
        return $this->isDefault;
    }

    public function setIsDefault(bool $isDefault): self
    {
        $this->isDefault = $isDefault;

        return $this;
    }

    public function getPreis(): ?string
    {
        return $this->Preis;
    }

    public function setPreis(string $Preis): self
    {
        $this->Preis = $Preis;

        return $this;
    }

    public function getGericht(): ?Gericht
    {
        return $this->gericht;
    }

    public function setGericht(?Gericht $gericht): self
    {
        $this->gericht = $gericht;

        return $this;
    }

    /**
     * @return Collection|Bestellung[]
     */
    public function getBestellungen(): Collection
    {
        return $this->Bestellungen;
    }

    public function addBestellungen(Bestellung $bestellungen): self
    {
        if (!$this->Bestellungen->contains($bestellungen)) {
            $this->Bestellungen[] = $bestellungen;
            $bestellungen->addGerichtVariation($this);
        }

        return $this;
    }

    public function removeBestellungen(Bestellung $bestellungen): self
    {
        if ($this->Bestellungen->removeElement($bestellungen)) {
            $bestellungen->removeGerichtVariation($this);
        }

        return $this;
    }

    public function getGeloescht(): ?bool
    {
        return $this->geloescht;
    }

    public function setGeloescht(bool $geloescht): self
    {
        $this->geloescht = $geloescht;

        return $this;
    }
}
