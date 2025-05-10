const express = require('express');
const cors = require('cors');
const app = express();
const port = 5000;

// Middleware to parse JSON
app.use(express.json());

// Middleware to handle CORS
app.use(cors());

// Demo profile data
app.get('/api/profile', (req, res) => {
    res.json({
        name: "Demo User",
        email: "demo@user.com",
        role: "Student"
    });
});

// Demo course content
app.get('/api/course-content', (req, res) => {
    res.json([
        { type: "fill", content: "Fill in the blanks demo content" },
        { type: "image_match", content: "image1" },
        { type: "audio", content: "Listen to this demo audio" },
        { type: "sentence", content: "Complete this demo sentence" }
    ]);
});

// Simulate the createCourseContent endpoint
app.post('/api/createCourseContent', (req, res) => {
    const { className } = req.body;

    if (className === "KG1") {
        res.json([
            { type: "fill", content: "Fill in the blanks for KG1" },
            { type: "image_match", content: "Match the image for KG1" },
            { type: "audio", content: "Listen to this audio for KG1" },
            { type: "sentence", content: "Complete the sentence for KG1" }
        ]);
    } else {
        res.status(400).json({ error: "Invalid className" });
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/api`);
});
