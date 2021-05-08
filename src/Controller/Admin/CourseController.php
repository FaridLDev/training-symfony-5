<?php

namespace App\Controller\Admin;

use App\Entity\Course;
use App\Repository\CourseRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

/**
 * @Route("/admin")
 */
class CourseController extends AbstractController
{
    /**
     * @Route("/course-list", name="course_index", methods={"GET"})
     */
    public function index(CourseRepository $programRepository): Response
    {
        return $this->render('admin/training/course/index.html.twig', [
            'courses' => $programRepository->findAll(),
        ]);
    }

    /**
     * @Route("/course/{id}", name="course_show", methods={"GET"})
     */
    public function show(Course $course): Response
    {
        return $this->render('admin/training/program/show.html.twig', [
            'course' => $course,
        ]);
    }

    /**
     * @Route("course/edit/{id}", name="course_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Course $course): Response
    {
        $form = $this->createForm(CourseType::class, $course);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()
                ->getManager()
                ->flush();

            return $this->redirectToRoute('course_index');
        }

        return $this->render('admin/training/course/edit.html.twig', [
            'course' => $course,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/test/course/delete/{id}", name="course_delete", methods={"POST"})
     */
    public function delete(Request $request, Course $course): Response
    {
        if (
            $this->isCsrfTokenValid(
                'delete' . $course->getId(),
                $request->request->get('_token')
            )
        ) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($course);
            $entityManager->flush();
        }

        return $this->redirectToRoute('course_index');
    }
}
