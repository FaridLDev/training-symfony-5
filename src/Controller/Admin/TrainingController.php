<?php

namespace App\Controller\Admin;

use App\Entity\Course;
use App\Entity\Training;
use App\Form\CourseType;
use App\Repository\UserRepository;
use App\Repository\TrainingRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\User;
use App\Form\UserType;
use App\Form\TrainingType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;

/**
 * @Route("/admin")
 */
class TrainingController extends AbstractController
{
    /**
     * @Route("/", name="admin_training_index")
     */
    public function adminHomePage(
        EntityManagerInterface $repository,
        Training $training = null,
        TrainingRepository $trainingRepository
    ) {
        $trainings = $trainingRepository->findCandidates();

        return $this->render('admin/training/index.html.twig', [
            'trainings' => $trainings,
        ]);
    }

    /**
     * @Route("/training/create", name="admin_training_new")
     * @Route("/training/edit/{id}", name="admin_training_edit")
     * @Security("is_granted('ROLE_ADMIN')")
     */
    public function edit(
        Training $training = null,
        Request $request,
        EntityManagerInterface $manager,
        TrainingRepository $trainingRepository,
        $id = null
    ) {
        $message = 'modifiée';
        if (!$training) {
            $training = new Training();
            $message = 'créer';
        }

        $form = $this->createForm(TrainingType::class, $training);

        $form->handleRequest($request);
        $participants = $trainingRepository->findOneById($id);

        if ($form->isSubmitted() && $form->isValid()) {
            $manager->persist($training);
            $manager->flush();

            $this->addFlash(
                'success',
                "La Formation <strong>{$training->getTitle()}</strong> a bien été" .
                    ' ' .
                    $message
            );

            return $this->redirectToRoute('admin_training_index');
        }

        return $this->render('admin/training/edit.html.twig', [
            'participants' => $participants,
            'training' => $training,
            'form' => $form->createView(),
            'editMode' => $training->getId() !== null,
        ]);
    }

    /**
     * @Route("/course", name="course_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $course = new Course();
        $form = $this->createForm(CourseType::class, $course);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($course);
            $entityManager->flush();

            return $this->redirectToRoute('course_index');
        }

        return $this->render('admin/training/course/new.html.twig', [
            'course' => $course,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/training/delete/{id}", name="admin_training_delete")
     * @Security("is_granted('ROLE_ADMIN')")
     */
    public function delete(Training $training, EntityManagerInterface $manager)
    {
        $manager->remove($training);
        $manager->flush();
        $this->addFlash(
            'success',
            "La Formation <strong>{$training->getTitle()}</strong> a bien été suprimer"
        );

        return $this->redirectToRoute('admin_training_index');
    }

    /**
     * @Route("/{formation}/action/{id}", name="admin_users_participant_validation")
     */
    public function action(
        TrainingRepository $trainingRepository,
        UserRepository $userAllrepo,
        $formation,
        EntityManagerInterface $manager,
        $id
    ) {
        $userAll = $userAllrepo->findById($id);

        $validation = $userAll[0]->getValidation();
        if ($validation == null) {
            $userAll[0]->setValidation('TRUE');
            $action = 'ajoutée';
        } else {
            $userAll[0]->setValidation(null);
            $action = 'retirée';
        }

        $manager->persist($userAll[0]);
        $manager->flush();

        $participants = $trainingRepository->findOneByTitle($formation);

        $this->addFlash(
            'success',
            "Utilisateur avec id = : <strong>{$id}</strong> a bien été $action à la liste d’étudiants"
        );

        return $this->redirectToRoute('admin_training_index');

        return $this->render('admin/training/users.html.twig', [
            'participants' => $participants,
        ]);
    }

    /**
     * @Route("/{formation}/{condition}", name="admin_users")
     */
    public function participants(
        EntityManagerInterface $repository,
        Training $training = null,
        TrainingRepository $trainingRepository,
        $formation,
        $condition
    ) {
        $participants = $trainingRepository->findOneByTitle($formation);

        return $this->render('admin/training/users.html.twig', [
            'participants' => $participants,
            'condition' => $condition,
        ]);
    }

    /**
     * @Route("/{formation}/delete/{id}", name="admin_user_delete")
     * @Security("is_granted('ROLE_ADMIN')")
     */
    public function deleteUser(
        UserRepository $userRepo,
        $formation,
        $id,
        EntityManagerInterface $manager
    ) {
        $user = $userRepo->findById($id);
        $manager->remove($user[0]);
        $manager->flush();

        $this->addFlash(
            'success',
            "Utilisateur avec id = : <strong>{$id}</strong> a bien été suprimer"
        );

        return $this->redirectToRoute('admin_users', [
            'condition' => 'banned',
            'formation' => $formation,
        ]);
    }
}
