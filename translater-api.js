import { Credentials, Translator } from "@translated/lara";

const credentials = new Credentials(
    process.env.LARA_TOKEN_ID,
    process.env.LARA_TOKEN_KEY
);

const lara = new Translator(credentials);

const text = process.argv.slice(2).join(" ");

if (!text) {
    console.error("No text provided");
    process.exit(1);
}

try {
    const result = await lara.translate(text, null, "fa-IR");
    console.log(result.translation);
} catch (error) {
    console.error("Translation error:", error.message);
    process.exit(1);
}
