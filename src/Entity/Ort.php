<?php

namespace App\Entity;

use App\Repository\OrtRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=OrtRepository::class)
 */
class Ort
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="integer")
     */
    private $PLZ;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $Ort;

    /**
     * @ORM\OneToMany(targetEntity=Restaurant::class, mappedBy="Ort")
     */
    private $restaurants;

    public function __construct()
    {
        $this->restaurants = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPLZ(): ?int
    {
        return $this->PLZ;
    }

    public function setPLZ(int $PLZ): self
    {
        $this->PLZ = $PLZ;

        return $this;
    }

    public function getOrt(): ?string
    {
        return $this->Ort;
    }

    public function setOrt(string $Ort): self
    {
        $this->Ort = $Ort;

        return $this;
    }

    /**
     * @return Collection|Restaurant[]
     */
    public function getRestaurants(): Collection
    {
        return $this->restaurants;
    }

    public function addRestaurant(Restaurant $restaurant): self
    {
        if (!$this->restaurants->contains($restaurant)) {
            $this->restaurants[] = $restaurant;
            $restaurant->setOrt($this);
        }

        return $this;
    }

    public function removeRestaurant(Restaurant $restaurant): self
    {
        if ($this->restaurants->removeElement($restaurant)) {
            // set the owning side to null (unless already changed)
            if ($restaurant->getOrt() === $this) {
                $restaurant->setOrt(null);
            }
        }

        return $this;
    }
}
