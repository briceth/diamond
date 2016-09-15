var ProposalList = React.createClass({
  render: function() {
    return (
      <div>
        {this.props.proposals.map(function(proposal){
          return <ProposalListItem proposal={proposal} key={proposal.id} />;
        })}
      </div>
    );
  }
});
