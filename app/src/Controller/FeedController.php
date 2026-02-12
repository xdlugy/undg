<?php

declare(strict_types=1);

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class FeedController extends AbstractController
{
    #[Route('/feed')]
    public function index(): Response
    {
        $name = "UNDG";

        return $this->render('feed/feed.html.twig', [
            'name' => $name
        ]);
    }
}
