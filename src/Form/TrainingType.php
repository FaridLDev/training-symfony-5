<?php

namespace App\Form;

use App\Entity\Course;
use App\Entity\Training;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class TrainingType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title', TextType::class, [
                'required' => true,
                'label' => 'Titre',
                'attr' => [
                    'placeholder' => 'Indiquer le titre de formation',
                ],
            ])
            ->add('startDate', DateType::class, [
                'required' => false,
                'label' => 'Date de début',
                'widget' => 'single_text',
                'attr' => [
                    'placeholder' => 'Date du début"',
                ],
            ])
            ->add('candidates', IntegerType::class, [
                'required' => true,
                'label' => 'Nombre de places',
                'attr' => [
                    'placeholder' =>
                        'Indiquer le nombre maximum de participants',
                ],
            ])

            ->add('location', TextType::class, [
                'required' => true,
                'label' => 'Ville',
                'attr' => [
                    'placeholder' => 'Indiquer la localisation',
                ],
            ])
            ->add('description', TextareaType::class, [
                'required' => true,
                'attr' => [
                    'placeholder' => 'L\'objectif de la formation',
                ],
            ])

            ->add('picture', TextType::class, [
                'required' => true,
                'label' => 'Image',
                'attr' => [
                    'placeholder' => 'L\'image de couverture',
                ],
            ])
            ->add('courses', EntityType::class, [
                'class' => Course::class,
                'label' => 'Cours',
                'choice_label' => 'theme',
                'multiple' => true,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Training::class,
        ]);
    }
}
