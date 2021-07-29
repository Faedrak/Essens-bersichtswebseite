<?php

namespace App\Entity;

use App\Repository\SammelBestellungRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=SammelBestellungRepository::class)
 */
class SammelBestellung
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
    private $AdminURL;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $PublicURL;

    /**
     * @ORM\ManyToOne(targetEntity=Restaurant::class, inversedBy="SammelBestellungen")
     * @ORM\JoinColumn(nullable=false)
     */
    private $Restaurant;

    /**
     * @ORM\OneToMany(targetEntity=Bestellung::class, mappedBy="sammelBestellung")
     */
    private $Bestellung;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $istOffen;

    public function __construct()
    {
        $this->Bestellung = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAdminURL(): ?string
    {
        return $this->AdminURL;
    }

    public function setAdminURL(string $AdminURL): self
    {
        $this->AdminURL = $AdminURL;

        return $this;
    }

    public function getPublicURL(): ?string
    {
        return $this->PublicURL;
    }

    public function setPublicURL(string $PublicURL): self
    {
        $this->PublicURL = $PublicURL;

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
     * @return Collection|Bestellung[]
     */
    public function getBestellung(): Collection
    {
        return $this->Bestellung;
    }

    public function addBestellung(Bestellung $bestellung): self
    {
        if (!$this->Bestellung->contains($bestellung)) {
            $this->Bestellung[] = $bestellung;
            $bestellung->setSammelBestellung($this);
        }

        return $this;
    }

    public function removeBestellung(Bestellung $bestellung): self
    {
        if ($this->Bestellung->removeElement($bestellung)) {
            // set the owning side to null (unless already changed)
            if ($bestellung->getSammelBestellung() === $this) {
                $bestellung->setSammelBestellung(null);
            }
        }

        return $this;
    }

    public function getIstOffen(): ?bool
    {
        return $this->istOffen;
    }

    public function setIstOffen(?bool $istOffen): self
    {
        $this->istOffen = $istOffen;

        return $this;
    }
}
