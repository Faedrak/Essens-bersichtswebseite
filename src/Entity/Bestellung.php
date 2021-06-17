<?php

namespace App\Entity;

use App\Repository\BestellungRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=BestellungRepository::class)
 */
class Bestellung
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
    private $GastName;

    /**
     * @ORM\ManyToMany(targetEntity=GerichtVariation::class, inversedBy="Bestellungen")
     */
    private $GerichtVariation;

    /**
     * @ORM\ManyToOne(targetEntity=SammelBestellung::class, inversedBy="Bestellung")
     */
    private $sammelBestellung;

    public function __construct()
    {
        $this->GerichtVariation = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getGastName(): ?string
    {
        return $this->GastName;
    }

    public function setGastName(string $GastName): self
    {
        $this->GastName = $GastName;

        return $this;
    }

    /**
     * @return Collection|GerichtVariation[]
     */
    public function getGerichtVariation(): Collection
    {
        return $this->GerichtVariation;
    }

    public function addGerichtVariation(GerichtVariation $gerichtVariation): self
    {
        if (!$this->GerichtVariation->contains($gerichtVariation)) {
            $this->GerichtVariation[] = $gerichtVariation;
        }

        return $this;
    }

    public function removeGerichtVariation(GerichtVariation $gerichtVariation): self
    {
        $this->GerichtVariation->removeElement($gerichtVariation);

        return $this;
    }

    public function getSammelBestellung(): ?SammelBestellung
    {
        return $this->sammelBestellung;
    }

    public function setSammelBestellung(?SammelBestellung $sammelBestellung): self
    {
        $this->sammelBestellung = $sammelBestellung;

        return $this;
    }
}
