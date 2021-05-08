<?php

namespace App\Controller\Home;

use App\Entity\User;
use App\Entity\Training;
use App\Repository\TrainingRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Notification\ContactNotification;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Form\UserType;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(
        TrainingRepository $trainingRepository,
        TrainingRepository $repository
    ): Response {
        $training = new Training();
        $trainings = $repository->findAll();

        return $this->render('home/index.html.twig', [
            'trainings' => $trainings,
        ]);
    }

    /**
     * @Route("/contact/{id}/{title}", name="contact")
     */
    public function contact(
        Training $training = null,
        Request $request,
        ContactNotification $notification,
        EntityManagerInterface $manager,
        TrainingRepository $trainingRepository,
        $id
    ): Response {
        $contact = new User();
        $contact->setTraining($training);

        $training = $trainingRepository->findOneById($id);

        $form = $this->createForm(UserType::class, $contact);

        $form->handleRequest($request);

        $startTraining = date_format($training->getStartDate(), 'd-m-Y');

        if (
            $training->getCandidates() <= $training->getClients()->count() ||
            strtotime($startTraining) <=
                strtotime(date('d-m-Y H:i:s') . '+ 1 days')
        ) {
            $this->addFlash(
                'danger',
                'Vous ne pouvez pas postuler dans cette Formation'
            );
            return $this->redirectToRoute('home');
        } else {
            if ($form->isSubmitted() && $form->isValid()) {
                $contact->addTraining($training);
                $manager->persist($contact);
                $manager->flush();

                $notification->notify($contact);
                $this->addFlash(
                    'success',
                    "Votre email pour Formation <strong>{$training->getTitle()}</strong> a bien été envoyé"
                );
            }
        }

        return $this->render('home/contact.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/information/{id}/{title}", name="info")
     */
    public function info(TrainingRepository $trainingRepository, $id)
    {
        $trainings = $trainingRepository->findOneById($id);

        foreach ($trainings->getCourses() as $i => $item) {
            $courses[] = $item;
        }

        return $this->render('home/information.html.twig', [
            'trainings' => $trainings,
            'courses' => $courses,
        ]);
    }
}
