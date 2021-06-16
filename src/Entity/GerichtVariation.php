<?php

namespace App\Entity;

use App\Repository\GerichtVariationRepository;
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
     * @ORM\Column(type="string", length=255)
     */
    private $Name;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isDefault;

    /**
     * @ORM\Column(type="decimal", precision=5, scale=2)
     */
    private $Preis;

    /**
     * @ORM\ManyToOne(targetEntity=Gericht::class, inversedBy="gerichtVariations")
     */
    private $Gericht;

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
        return $this->Gericht;
    }

    public function setGericht(?Gericht $Gericht): self
    {
        $this->Gericht = $Gericht;

        return $this;
    }
}
