import React, { useState } from "react";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";

export default function Login() {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    function validateForm() {
        return email.length > 0 && password.length > 0;
    }

    function handleSubmit(event) {
        const token = document.querySelector('meta[name="csrf-token"]').content;
        const authenticateURL = "/api/v1/access/authenticate";
        fetch(authenticateURL, {
            method: "POST",
            headers: {
                "X-CSRF-Token": token,
                "Content-Type": "application/json"
            },
            body: JSON.stringify({'email': email, 'password': password})
        })
            .then(response => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error("Network response was not ok.");
            })
            .then(response => {
                window.location.reload(false);
            })
            .catch(error => console.log(error.message));

        event.preventDefault();
    }

    return (
        <div className="Login">
            <Form onSubmit={handleSubmit}>
                <Form.Group size="lg" controlId="email">
                    <Form.Label>Email</Form.Label>
                    <Form.Control
                        autoFocus
                        type="email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                    />
                </Form.Group>
                <Form.Group size="lg" controlId="password">
                    <Form.Label>Password</Form.Label>
                    <Form.Control
                        type="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                    />
                </Form.Group>
                <Button block size="lg" type="submit" disabled={!validateForm()}>
                    Login
                </Button>
            </Form>
        </div>
    );
}