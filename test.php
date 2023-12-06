function convertHTMLToRawText($htmlParam) {
    // Remove HTML tags
    $rawText = preg_replace("/<[^>]*>/", "", $htmlParam);

    // Decode HTML entities
    $rawText = html_entity_decode($rawText);

    // Normalize newlines and whitespace (optional)
    $rawText = str_replace(["\r\n", "\n", "\t"], "\n", $rawText);
    $rawText = preg_replace("/\s{2,}/", " ", $rawText);

    return trim($rawText);
}
$htmlParam = "<p>This is an example of HTML text with tags and entities.</p>";
$rawText = convertHTMLToRawText($htmlParam);
echo $rawText; // Output: This is an example of HTML text with tags and entities.
