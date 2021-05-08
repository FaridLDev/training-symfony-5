<?php

namespace App\Entity;
use DateTimeInterface;
use Symfony\Component\Validator\Constraints as Assert;

class Contact
{
    /**
     * @var string|null
     * @Assert\NotBlank()
     * @Assert\Length(
     * min=2,
     * max=75,
     * minMessage="Le nombre minimum de caractères est de de {{ limit }}",
     * maxMessage="Le nombre maximum de caractères est de de {{ limit }}"
     * )
     */
    private $firstname;

    /**
     * @var string|null
     * @Assert\NotBlank()
     * @Assert\Length(
     * min=2,
     * max=75,
     * minMessage="Le nombre minimum de caractères est de de {{ limit }}",
     * maxMessage="Le nombre maximum de caractères est de de {{ limit }}"
     * )
     */
    private $lastname;

    // /**
    //  * @var string|null
    //  * @Assert\NotBlank()
    //  * @Assert\Regex(
    //  * pattern="/[0-9]{10}/",
    //  * message=" {{ value }} est incorrect"
    //  * )
    //  */
    // private $phone;

    /**
     * @var string|null
     * @Assert\Email()
     */
    private $email;

    /**
     * @var string|null
     * @Assert\NotBlank()
     * @Assert\Length(
     * min=10,
     * max=100,
     * minMessage="Le nombre minimum de caractères est de de {{ limit }}",
     * maxMessage="Le nombre maximum de caractères est de de {{ limit }}"
     * )
     */
    private $message;

    /**
     * @var Training|null
     */
    private $training;

    /**
     * @return string|null
     */
    public function getFirstname(): ?string
    {
        return $this->firstname;
    }

    /**
     *
     * @param string|null $firstname
     * @return Contact
     */
    public function setFirstname(?string $firstname): Contact
    {
        $this->firstname = $firstname;
        return $this;
    }

    /**
     *
     * @return string|null
     */
    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    /**
     * Undocumented function
     *
     * @param string|null $lastname
     * @return Contact
     */
    public function setLastname(?string $lastname): Contact
    {
        $this->lastname = $lastname;
        return $this;
    }

    /**
     *
     * @return string|null
     */
    public function getEmail(): ?string
    {
        return $this->email;
    }

    /**
     * Undocumented function
     *
     * @param string|null $email
     * @return Contact
     */
    public function setEmail(?string $email): Contact
    {
        $this->email = $email;
        return $this;
    }

    /**
     *
     * @return string|null
     */
    public function getMessage(): ?string
    {
        return $this->message;
    }

    /**
     * Undocumented function
     *
     * @param string|null $message
     * @return Contact
     */
    public function setMessage(?string $message): Contact
    {
        $this->message = $message;
        return $this;
    }

    /**
     * Undocumented function
     *
     * @return Training|null
     */
    public function getTraining(): ?Training
    {
        return $this->training;
    }

    /**
     * Undocumented function
     *
     * @param Training|null $training
     * @return Contact
     */
    public function setTraining(Training $training): Contact
    {
        $this->training = $training;
        return $this;
    }
}
