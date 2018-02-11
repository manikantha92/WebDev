import React from 'react';
import ReactDOM from 'react-dom';
import {Button} from 'reactstrap';

export default function run_demo(root, channel) {
  ReactDOM.render(<Demo channel={channel}/>, root);
}

var cardCount = 0;
class Demo extends React.Component {
  constructor(props) {
    super(props);
    this.channel = props.channel;
    this.state = {
      initialGameState: [],
      count: 0
    };
    this.channel.join().receive("ok", this.gotView.bind(this)).receive("error", resp => {
      console.log("Unable to join", resp)
    });
  }

  gotView(view) {
    console.log("New view", view);
    this.setState(view.game);
  }

  sendOpenCard(card) {
    cardCount = cardCount + 1;
    let newgame = this.channel.push("startGame", {card: card}).receive("ok", this.gotView.bind(this));
    if (cardCount == 2) {
      this.isMatched();
      cardCount = 0;
    }
  }

  isMatched() {
    this.channel.push("matched", {matched: "game"}).receive("ok", this.gotView.bind(this));
  }

  resetBuilder(e) {
    this.channel.push("reset", {reset: "game"}).receive("ok", this.gotView.bind(this));
  }

  render() {
    //go to each row and access each of the values from the object
    let cardlist = this.state.initialGameState.map((cardrow, rowindex) => <tr key={rowindex}>
      {
        cardrow.map((card, i) => <td key={i} onClick={() => this.sendOpenCard(card)}>
          <div className={card.done
              ? "card done"
              : "card"}>
            <p>{
                card.flipped
                  ? card.value
                  : "?"
              }</p>
          </div>
        </td>)
      }
    </tr>);

    return (<div>
      <table>
        <tbody>
          {cardlist}
        </tbody>
      </table>
      <ShowClicks state={this.state}/>
      <Button onClick={() => this.resetBuilder(this)}>
        Reset
      </Button>
    </div>);
  }
}

function ShowClicks(props) {
  let state = props.state;
  return <h4>Number of Clicks: {state.count}
  </h4>;
}
