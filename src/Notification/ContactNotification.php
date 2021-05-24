<?php

namespace App\Notification;

use App\Entity\User;
use Twig\Environment;

class ContactNotification
{
    /**
     * @var \Swift_Mailer
     */
    private $mailer;

    /**
     * @var Enviroement
     */
    private $renderer;

    public function __construct(\Swift_Mailer $mailer, Environment $renderer)
    {
        $this->mailer = $mailer;
        $this->renderer = $renderer;
    }

    public function notify(User $contact)
    {
        $message = (new \Swift_Message(
            'Formation :' . $contact->training->getTitle()
        ))
            ->setFrom('youmail@')
            ->setTo('youmail@')
            ->setReplyTo($contact->getEmail())
            ->setBody(
                $this->renderer->render('emails/contact.html.twig', [
                    'contact' => $contact,
                ]),
                'text/html'
            );
        $this->mailer->send($message);
    }
}
