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
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $GastName;

    /**
     * @ORM\ManyToMany(targetEntity=GerichtVariation::class, inversedBy="bestellungen")
     */
    private $Gerichte;

    /**
     * @ORM\ManyToOne(targetEntity=SammelBestellung::class, inversedBy="bestellungs")
     */
    private $SammelBestellung;

    public function __construct()
    {
        $this->Gerichte = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getGastName(): ?string
    {
        return $this->GastName;
    }

    public function setGastName(?string $GastName): self
    {
        $this->GastName = $GastName;

        return $this;
    }

    /**
     * @return Collection|GerichtVariation[]
     */
    public function getGerichte(): Collection
    {
        return $this->Gerichte;
    }

    public function addGerichte(GerichtVariation $gerichte): self
    {
        if (!$this->Gerichte->contains($gerichte)) {
            $this->Gerichte[] = $gerichte;
        }

        return $this;
    }

    public function removeGerichte(GerichtVariation $gerichte): self
    {
        $this->Gerichte->removeElement($gerichte);

        return $this;
    }

    public function getSammelBestellung(): ?SammelBestellung
    {
        return $this->SammelBestellung;
    }

    public function setSammelBestellung(?SammelBestellung $SammelBestellung): self
    {
        $this->SammelBestellung = $SammelBestellung;

        return $this;
    }
}
