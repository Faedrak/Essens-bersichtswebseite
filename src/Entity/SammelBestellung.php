<?php

namespace App\Entity;

use App\Repository\SammelBestellungRepository;
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
}
