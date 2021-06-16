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
    private $PublicID;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $AdminID;

    /**
     * @ORM\OneToMany(targetEntity=Bestellung::class, mappedBy="SammelBestellung")
     */
    private $bestellungs;

    public function __construct()
    {
        $this->bestellungs = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPublicID(): ?string
    {
        return $this->PublicID;
    }

    public function setPublicID(string $PublicID): self
    {
        $this->PublicID = $PublicID;

        return $this;
    }

    public function getAdminID(): ?string
    {
        return $this->AdminID;
    }

    public function setAdminID(string $AdminID): self
    {
        $this->AdminID = $AdminID;

        return $this;
    }

    /**
     * @return Collection|Bestellung[]
     */
    public function getBestellungs(): Collection
    {
        return $this->bestellungs;
    }

    public function addBestellung(Bestellung $bestellung): self
    {
        if (!$this->bestellungs->contains($bestellung)) {
            $this->bestellungs[] = $bestellung;
            $bestellung->setSammelBestellung($this);
        }

        return $this;
    }

    public function removeBestellung(Bestellung $bestellung): self
    {
        if ($this->bestellungs->removeElement($bestellung)) {
            // set the owning side to null (unless already changed)
            if ($bestellung->getSammelBestellung() === $this) {
                $bestellung->setSammelBestellung(null);
            }
        }

        return $this;
    }
}
