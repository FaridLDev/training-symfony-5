<?php

namespace App\Controller\Admin;

use App\Entity\Training;
use App\Repository\TrainingRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

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
}
