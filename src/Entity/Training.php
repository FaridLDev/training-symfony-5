<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\TrainingRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Entity(repositoryClass=TrainingRepository::class)
 */
class Training
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
    private $title;

    /**
     * @ORM\Column(type="datetime")
     * @Assert\GreaterThan("today", message="La date indiquer doit être ultérieur à la date d'aujourd'hui !")
     */
    private $startDate;

    /**
     * @ORM\Column(type="integer")
     * @Assert\Type(type="integer")
     * @Assert\Expression("this.getCandidates() >= this.getStudent()",
     * message="Attention! Le nombre de participants est supérieur au nombre de places!")
     */
    private $candidates;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $location;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $description;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $picture;

    /**
     * @ORM\Column(type="integer", nullable=true)
     *  @Assert\Expression("this.getCandidates() >= this.getStudent()",
     *  message="Attention! Le nombre de participants est supérieur au nombre de places!")
     */
    private $student;

    /**
     * @ORM\ManyToMany(targetEntity=Course::class, inversedBy="names")
     */
    private $courses;

    /**
     * @ORM\ManyToMany(targetEntity=User::class, inversedBy="trainings")
     */
    private $clients;

    public function __construct()
    {
        $this->courses = new ArrayCollection();
        $this->clients = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getStartDate(): ?\DateTimeInterface
    {
        return $this->startDate;
    }

    public function setStartDate(\DateTimeInterface $startDate): self
    {
        $this->startDate = $startDate;

        return $this;
    }

    public function getCandidates(): ?int
    {
        return $this->candidates;
    }

    public function setCandidates(int $candidates): self
    {
        $this->candidates = $candidates;

        return $this;
    }

    public function getLocation(): ?string
    {
        return $this->location;
    }

    public function setLocation(?string $location): self
    {
        $this->location = $location;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getPicture(): ?string
    {
        return $this->picture;
    }

    public function setPicture(?string $picture): self
    {
        $this->picture = $picture;

        return $this;
    }

    public function getStudent(): ?int
    {
        return $this->student;
    }

    public function setStudent(?int $student): self
    {
        $this->student = $student;

        return $this;
    }

    /**
     * @return Collection|Course[]
     */
    public function getCourses(): Collection
    {
        return $this->courses;
    }

    public function addCourse(Course $course): self
    {
        if (!$this->courses->contains($course)) {
            $this->courses[] = $course;
            $course->addName($this);
        }

        return $this;
    }

    public function removeCourse(Course $course): self
    {
        $this->courses->removeElement($course);
        $course->removeName($this);

        return $this;
    }

    /**
     * @return Collection|User[]
     */
    public function getClients(): Collection
    {
        return $this->clients;
    }

    public function addClient(User $client): self
    {
        if (!$this->clients->contains($client)) {
            $this->clients[] = $client;
        }

        return $this;
    }

    public function removeClient(User $client): self
    {
        $this->clients->removeElement($client);

        return $this;
    }
}
