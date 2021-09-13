import React, { useState, useEffect } from "react";
import { LazyLoadImage } from 'react-lazy-load-image-component';
import Login from "./Login_Form";
import {UserContext} from "./context/userContext";
import PokemonCatch from "./Pokemon_Catch";

class PokemonCollection extends React.Component {
    constructor(props) {
        super(props);
    
        this.goHome = this.goHome.bind(this);
        this.trade = this.trade.bind(this);
        this.state = {data: []}
    }

    goHome(){
        this.props.history.push(`/pokemon`)
    }

    trade(){
        //TODO
    }

    PokemonViewer() {
        let data = this.state.data;
        if(data) {
            console.log(JSON.stringify(data))

            if(data.status == "error" && data.code == 403){
                return <Login />
            }

            return <div>
                <h1 className="display-4">Your Collection</h1>
                <ul className="horizontal">
                    { data.map(card =>
                        <li key={card.id}>
                            <LazyLoadImage effect="blur" src={card.image_url}  width={200} alt={card.name}/>
                        </li>
                    )}
                </ul>
            </div>;
        }

        return <div>
            <h1 className="display-4">Fetching Collection</h1>
        </div>;

    }

    componentDidMount() {
        const catchURL = "/api/v1/pokemon/collection";

        fetch(catchURL, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            },
        })
            .then(response => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error("Network response was not ok.");
            })
            .then(response => this.setState({data: response}))
            .catch(error => console.log(error.message));

    }

    render() {
        let userInfo = this.context;
        let data = this.state.data

        let content;
        if(!userInfo.isLoggedIn || (data.status && data.status == "error" && data.code == 403)){
            content = <Login />;
        } else {
            content = <div>
                <h1 className="display-4">Your Collection</h1>
                <ul className="horizontal">
                    { data.map(card =>
                        <li key={card.id}>
                            <LazyLoadImage effect="blur" src={card.image_url}  width={200} alt={card.name}/>
                        </li>
                    )}
                </ul>
            </div>
        }

        return (
            <div className="vw-100 vh-100 primary-color d-flex align-items-sm-center justify-content-center">
                <div className="jumbotron jumbotron-fluid bg-transparent">
                    <div className="container secondary-color">
                    {content}
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
                </div>
            </div>
        );
    }
}

PokemonCollection.contextType = UserContext;

export default PokemonCollection;