import React, { useState } from "react";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import {UserContext} from "./context/userContext";

class Login extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            mode: 'login',
            email: "",
            password: "",
            passwordConfirmation: "",
            message:"A valid account is required to access this game. Please log in or create a new account."
        }
        this.handleSubmit = this.handleSubmit.bind(this);
        this.toggleMode = this.toggleMode.bind(this);
        this.validateForm = this.validateForm.bind(this);
    }


    validateForm() {
        return this.state.email.length > 0 && this.state.password.length > 0;
    }

    handleSubmit(event) {
        let userInfo = this.context;
        const token = document.querySelector('meta[name="csrf-token"]').content;
        const authenticateURL = "/api/v1/access/" + (this.state.mode == 'login' ? 'authenticate' : 'new_user');
        let user;
        if(this.state.mode == 'login') {
            user = {
                'email': this.state.email,
                'password': this.state.password}
        } else {
            user = {
                'email': this.state.email,
                'password': this.state.password,
                'password_confirmation': this.state.passwordConfirmation}
        }
        fetch(authenticateURL, {
            method: "POST",
            headers: {
                "X-CSRF-Token": token,
                "Content-Type": "application/json"
            },
            body: JSON.stringify({user: user})
        })
            .then(response => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error("Network response was not ok.");
            })
            .then(response => {
                console.log(response);
                if(response.logged_in) {
                    userInfo.setLoginInfo(true, response.user);
                    this.setState({message: ''});
                } else {
                    this.setState({message: response.message});
                }
            })
            .catch(error => {
                console.log(error.message);
                this.setState({message: error.message})
            });

        event.preventDefault();
    }

    toggleMode(){
        this.setState({mode: this.state.mode == 'login' ? 'newUser' : 'login'});
    }

    render() {
        let confirmPassword = "";
        if(this.state.mode == 'newUser'){
            confirmPassword = (
                <Form.Group size="lg" controlId="password_confirmation">
                    <Form.Label>Confirm Password</Form.Label>
                    <Form.Control
                        type="password"
                        value={this.state.passwordConfirmation}
                        onChange={(e) => {
                            this.setState({passwordConfirmation: e.target.value});
                        }}
                    />
                </Form.Group>
            );
        }
        return (
            <div className="Login">
                <div>
                    <p className={"message"}> {this.state.message} </p>
                </div>
                <Form onSubmit={this.handleSubmit}>
                    <Form.Group size="lg" controlId="email">
                        <Form.Label>Email</Form.Label>
                        <Form.Control
                            autoFocus
                            type="email"
                            value={this.state.email}
                            onChange={(e) => {
                                this.setState({email: e.target.value});
                            }}
                        />
                    </Form.Group>
                    <Form.Group size="lg" controlId="password">
                        <Form.Label>Password</Form.Label>
                        <Form.Control
                            type="password"
                            value={this.state.password}
                            onChange={(e) => {
                                this.setState({password: e.target.value});
                            }}
                        />
                    </Form.Group>
                    {confirmPassword}
                    <ul className="horizontal">
                        <li>
                            <Button block size="lg" type="submit" disabled={!this.validateForm()}>
                                {this.state.mode == 'login' ? 'Login' : 'Create Account'}
                            </Button>
                        </li>
                        <li>
                            <a onClick={this.toggleMode} href="javascript:void(0);">{this.state.mode == 'login' ? 'Create Account' : 'Login'}</a>
                        </li>
                    </ul>
                </Form>
            </div>
        );

    }
}
Login.contextType = UserContext;

export default Login;