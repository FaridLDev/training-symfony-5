<?php

namespace App\Entity;

use App\Repository\CourseRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CourseRepository::class)
 */
class Course
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
    private $theme;

    /**
     * @ORM\ManyToMany(targetEntity=Training::class, mappedBy="courses")
     */
    private $names;

    public function __construct()
    {
        $this->names = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTheme(): ?string
    {
        return $this->theme;
    }

    public function setTheme(string $theme): self
    {
        $this->theme = $theme;

        return $this;
    }

    /**
     * @return Collection|Training[]
     */
    public function getNames(): Collection
    {
        return $this->names;
    }

    public function addName(Training $name): self
    {
        if (!$this->names->contains($name)) {
            $this->names[] = $name;
            $name->addCourse($this);
        }

        return $this;
    }

    public function removeName(Training $name): self
    {
        if ($this->names->removeElement($name)) {
            $name->removeCourse($this);
        }

        return $this;
    }
}
