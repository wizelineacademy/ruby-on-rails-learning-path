import React from "react";
import Login from "./Login_Form";

class PokemonHome extends React.Component {
    constructor(props) {
        super(props);

        this.catchPokemon = this.catchPokemon.bind(this);
        this.viewCollection = this.viewCollection.bind(this);
        this.trade = this.trade.bind(this);

    }

    catchPokemon(){
        this.props.history.push(`/pokemon/catch`)
    }

    viewCollection(){
        //TODO
    }

    trade(){
        //TODO
    }

    render() {
        return (
            <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
                <div className="jumbotron jumbotron-fluid bg-transparent">
                    <div className="container secondary-color">
                        <h1 className="display-4">Pokemon: Collect 'em all</h1>
                        <p className="lead">
                            Catch pokemon and trade with friends to complete your collection
                        </p>
                        <hr className="my-4"/>
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
                                    onClick={this.trade}
                                >
                                    Trade
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        );
    }
}

export default PokemonHome;