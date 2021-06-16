<?php

namespace App\Entity;

use App\Repository\KategorieRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=KategorieRepository::class)
 */
class Kategorie
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
    private $Bezeichner;

    /**
     * @ORM\ManyToOne(targetEntity=Restaurant::class, inversedBy="kategories")
     */
    private $Restaurant;

    /**
     * @ORM\ManyToMany(targetEntity=Gericht::class, inversedBy="kategories")
     */
    private $Gerichte;

    public function __construct()
    {
        $this->Gerichte = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getBezeichner(): ?string
    {
        return $this->Bezeichner;
    }

    public function setBezeichner(string $Bezeichner): self
    {
        $this->Bezeichner = $Bezeichner;

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
        }

        return $this;
    }

    public function removeGerichte(Gericht $gerichte): self
    {
        $this->Gerichte->removeElement($gerichte);

        return $this;
    }
}
