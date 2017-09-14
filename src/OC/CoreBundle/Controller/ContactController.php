<?php

namespace OC\CoreBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ContactController extends Controller
{
    public function indexAction(Request $request)
    {
    	$session = $request->getSession();
    	$session->getFlashBag()->add('info', 'Message flash : Page d\'accueil non disponible, revenez plus tard !');

        return $this->redirectToRoute('oc_core_home');
    }
}
