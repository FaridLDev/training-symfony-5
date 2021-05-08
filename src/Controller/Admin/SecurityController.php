<?php

namespace App\Controller\Admin;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

/**
 * @Route("/admin")
 */
class SecurityController extends AbstractController
{
    /**
     * Permet de se connecter
     *
     * @Route("/login", name="admin_account_login")
     */
    public function login(AuthenticationUtils $authenticationAdmins)
    {
        $error = $authenticationAdmins->getLastAuthenticationError();
        $username = $authenticationAdmins->getLastUsername();

        return $this->render('admin/security/login.html.twig', [
            'hasError' => $error !== null,
            'username' => $username,
        ]);
    }

    /**
     * Permet de se déconnecter
     *
     * @Route("/logout", name="admin_account_logout")
     *
     * @return void
     */
    public function logout()
    {
        //....
    }
}
