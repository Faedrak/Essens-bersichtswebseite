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
     * @ORM\OneToMany(targetEntity=Gericht::class, mappedBy="Kategorie")
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

    /**
     * @return Collection|Gericht[]
     */
    public function getGerichte(): Collection
    {
        return $this->Gerichte;
    }

    public function addGericht(Gericht $gerichte): self
    {
        if (!$this->Gerichte->contains($gerichte)) {
            $this->Gerichte[] = $gerichte;
            $gerichte->setKategorie($this);
        }

        return $this;
    }

    public function removeGericht(Gericht $gerichte): self
    {
        if ($this->Gerichte->removeElement($gerichte)) {
            // set the owning side to null (unless already changed)
            if ($gerichte->getKategorie() === $this) {
                $gerichte->setKategorie(null);
            }
        }

        return $this;
    }
}
