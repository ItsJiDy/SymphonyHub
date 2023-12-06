<?php
$isGetRequest = isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET';

if ($isGetRequest) {
    // Handle GET API request
    $text = $_GET['text'];
    $processedText = processText($text); // Implement your text processing function here
    echo $processedText;
} else {
    // Handle direct page loading
    // Generate and display raw text directly in HTML
    $rawText = "Generated Raw Text"; // Replace with your desired raw text
    echo $rawText;
}
