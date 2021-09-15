import React from "react";
import Login from "./Login_Form";
import {UserContext} from "./context/userContext";

class PokemonHome extends React.Component {

    constructor(props) {
        super(props);
        this.viewCollection = this.viewCollection.bind(this);
        this.catchPokemon = this.catchPokemon.bind(this);
        this.viewAllPokemon = this.viewAllPokemon.bind(this);
        this.retrieveCollection = this.retrieveCollection.bind(this);

        this.state = {
            collection: []
        }
    }

    viewAllPokemon(){
        this.props.history.push(`/pokemon/all_pokemon`)
    }

    catchPokemon(){
        this.props.history.push(`/pokemon/catch`)
    }

    viewCollection(){
        this.props.history.push(`/pokemon/collection`)
    }

    componentDidMount() {
        this.retrieveCollection();
    }

    retrieveCollection(){
        const collectionURL = "/api/v1/pokemon/collection";

        fetch(collectionURL, {
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
            .then(response => this.setState({collection: response}))
            .catch(error => console.log(error.message));
    }

    render() {
        let userInfo = this.context;

        let actions;
        if(!userInfo.isLoggedIn) {
            actions = <Login />
        } else {
            actions = (
                <ul className="horizontal">
                    <li>
                        <button
                            type="button"
                            className="btn btn-lg custom-button"
                            role="button"
                            onClick={this.catchPokemon}
                        >
                            Catch Pokemon
                        </button>
                    </li>
                    <li>
                        <button
                            type="button"
                            className="btn btn-lg custom-button"
                            role="button"
                            onClick={this.viewCollection}
                        >
                            View Collection
                        </button>
                    </li>
                    <li>
                        <button
                            type="button"
                            className="btn btn-lg custom-button"
                            role="button"
                            // onClick={this.trade}
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
                </ul>)
        }


        return (
            <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
                <div className="jumbotron jumbotron-fluid bg-transparent">
                    <div className="container secondary-color">
                        <h1 className="display-4">Pokemon: Collect 'em all</h1>
                        <p className="lead">
                            Catch pokemon and trade with friends to complete your collection.
                        </p>
                        {userInfo.isLoggedIn && this.state.collection ? <p>You have collected a total of {this.state.collection.length} pokemon.</p> : ''}
                        <hr className="my-4"/>
                        {actions}
                    </div>
                </div>
            </div>
        );


    }
}

PokemonHome.contextType = UserContext;

export default PokemonHome;
