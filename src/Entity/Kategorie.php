<?php

namespace App\Entity;

use App\Repository\KategorieRepository;
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
}
