import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Room from "../components/Room";
import Pokemon_Home from "../components/Pokemon_Home";
import Pokemon_Catch from "../components/Pokemon_Catch";
import Pokemon_Collection from "../components/Pokemon_Collection";

export default (
    <Router>
        <Switch>
            <Route path="/" exact component={Home}/>
            <Route path="/room/:uuid" exact component={Room}/>

            <Route path="/pokemon" exact component={Pokemon_Home} />
            <Route path="/pokemon/catch" exact component={Pokemon_Catch} />
            <Route path="/pokemon/collection" exact component={Pokemon_Collection} />
        </Switch>
    </Router>
);