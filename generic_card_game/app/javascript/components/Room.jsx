import React from "react";
import ReactDOM from "react-dom";

class Room extends React.Component {
    constructor(props) {
        super(props);
        this.state = { room: { uuid: "" } };
    
    }

    onUnload = e => {
      const token = document.querySelector('meta[name="csrf-token"]').content;
      const leaveRoomURL = "/api/v1/rooms/leave";

      fetch(leaveRoomURL, {
          method: "POST",
          headers: {
          "X-CSRF-Token": token,
          "Content-Type": "application/json"
          },
      })
          .then(response => {
            if (!response.ok) {
              throw new Error("Network response was not ok.");
            }
          })
          .catch(error => console.log(error.message));
    };

    componentWillUnmount() {
      window.removeEventListener("beforeunload", this.onUnload);
    }

    componentDidMount() {
      window.addEventListener("beforeunload", this.onUnload);
        const {
          match: {
            params: { uuid }
          }
        } = this.props;
    
        const url = `/api/v1/room/${uuid}`;
    
        fetch(url)
          .then(response => {
            if (response.ok) {
              return response.json();
            }
            throw new Error("Network response was not ok.");
          })
          .then(response => {
            console.log("Response: " + response);
            this.setState({ room: response.data.attributes });
          })
          .catch(() => this.props.history.push("/"));

    }

    render() {
        const { room } = this.state;
        const playerItems = [];
        if(room.players) {
          console.log(room.players);
          room.players.forEach(player => {
            playerItems.push(<li key={player.id}>{player.name}</li>);
          })
        }
        
        return (
            <div className="room">
              <h1>Room ID: {room.uuid}</h1> <br />
              <h2>Players</h2>
              <ul>
                { playerItems }
              </ul>
            </div>
          )
    }

}

export default Room