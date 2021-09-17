import React from "react";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import {UserContext} from "./context/userContext";
import {LazyLoadImage} from "react-lazy-load-image-component";
import Login from "./Login_Form";

class CreateCustomPokemon extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            name: "",
            image: "",
            rarity: "common",
            message: "Create a custom pokemon"
        }
        this.handleSubmit = this.handleSubmit.bind(this);
        this.validateForm = this.validateForm.bind(this);
    }


    validateForm() {
        return this.state.name.length > 0 && this.state.image.length > 0;
    }

    handleSubmit(event) {
        const token = document.querySelector('meta[name="csrf-token"]').content;
        const authenticateURL = "/api/v1/pokemon/new_custom";
        fetch(authenticateURL, {
            method: "POST",
            headers: {
                "X-CSRF-Token": token,
                "Content-Type": "application/json"
            },
            body: JSON.stringify({pokemon: this.state})
        })
            .then(response => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error("Network response was not ok.");
            })
            .then(response => {
                console.log(response);
                this.setState({message: response.message});
            })
            .catch(error => {
                console.log(error.message);
                this.setState({message: error.message})
            });

        event.preventDefault();
    }

    render() {
        let userInfo = this.context;
        let imagePreview = '';
        if(this.state.image) {
            imagePreview = <LazyLoadImage src={this.state.image} width={300}></LazyLoadImage>
        }
        if(!userInfo.isLoggedIn){
            return <div className="container2">
                <Login />;
            </div>
        }
        return (
                <div className="container2">
                    <div>
                        <p className={"message"}> {this.state.message} </p>
                    </div>
                    <Form onSubmit={this.handleSubmit}>
                        <Form.Group size="lg" controlId="name">
                            <Form.Label>Name</Form.Label>
                            <Form.Control
                                autoFocus
                                value={this.state.name}
                                onChange={(e) => {
                                    this.setState({name: e.target.value});
                                }}
                            />
                        </Form.Group>
                        <Form.Group size="lg" controlId="rarity">
                            <Form.Label>Rarity</Form.Label>
                            <select value={this.state.rarity} onChange={(e) => {
                                this.setState({rarity: e.target.value});
                            }}>
                                <option value="common">Common</option>
                                <option value="rare">Rare</option>
                                <option value="legendary">Legendary</option>
                            </select>
                        </Form.Group>
                        <Form.Group size="lg" controlId="image">
                            <Form.Label>Image URL</Form.Label>
                            <Form.Control
                                value={this.state.image}
                                onChange={(e) => {
                                    this.setState({image: e.target.value});
                                }}
                            />
                        </Form.Group>
                        <ul className="horizontal">
                            <li>
                                <Button block size="lg" type="submit" disabled={!this.validateForm()}>
                                    Create Pokemon
                                </Button>
                            </li>
                        </ul>
                    </Form>
                    <br />
                    {imagePreview}
                    <hr className="my-4"/>
                    <ul className="horizontal">
                        <li>
                            <button
                                type="button"
                                className="btn btn-lg custom-button"
                                role="button"
                                onClick={this.goHome}
                            >
                                Back Home
                            </button>
                        </li>
                        <li>
                            <button
                                type="button"
                                className="btn btn-lg custom-button"
                                role="button"
                                onClick={this.trade}
                            >
                                Trade
                            </button>
                        </li>
                        <li>
                            <button
                                type="button"
                                className="btn btn-lg custom-button"
                                role="button"
                                onClick={userInfo.logout}
                            >
                                Log out
                            </button>
                        </li>
                    </ul>
                </div>
        );

    }
}
CreateCustomPokemon.contextType = UserContext;

export default CreateCustomPokemon;