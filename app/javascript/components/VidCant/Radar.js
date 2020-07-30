import React from 'react';
import { useState } from 'react';
import { format } from 'd3-format';
import { RadarChart, Hint } from 'react-vis';
import { Query } from 'react-apollo';
import gql from 'graphql-tag';
const radar_query = gql`
{
  radar {
    name
    numconf
    ratetotal
    numdeaths
    percentdeath
    ratetested
    numactive
  }
}
`;

const tipStyle = {
  display: 'flex',
  fontFamily: "Cairo",
  color: '#fff',
  background: '#000',
  alignItems: 'center',
  padding: '5px',
  borderRadius: '5px'
};

const kFormat = format('~s');
export default function Radar(props) {
  const [hoveredCell, setHovered] = useState(false)
  return (
    <Query query={radar_query}>
      {(request) => (
        <div>
          {request.loading
            ? 'loading...' // to do animation
            :
            <RadarChart
              data={request.data.radar.map((el) => (
                {
                  "name": el.name,
                  "numconf": el.numconf,
                  "ratetotal": el.ratetotal,
                  "numdeaths": el.numdeaths,
                  "percentdeath": el.percentdeath,
                  "ratetested": el.ratetested,
                  "numactive": el.numactive
                }
              ))}
              startingAngle={0}
              domains={[
                { name: 'Cases', domain: [0, 60000], getValue: d => d.numconf, tickFormat: t => kFormat(t) },
                {
                  name: 'Rate',
                  domain: [0, 700],
                  getValue: d => d.ratetotal
                },
                { name: 'Deaths', domain: [0, 5670], getValue: d => d.numdeaths },
                { name: 'Deaths percentage', domain: [0, 15], getValue: d => d.percentdeath },
                { name: 'Rate tested', domain: [0, 150000], getValue: d => d.ratetested },
                { name: 'Active', domain: [0, 2341], getValue: d => d.numactive },
              ]}
              width={400}
              height={400}
              onSeriesMouseOver={(data) => {
                setHovered(data.event[0]);
              }}
              onSeriesMouseOut={() => setHovered(false)}
            >
              {hoveredCell && (
                <Hint value={{ x: 0, y: 0 }}>
                  <div style={tipStyle}>{hoveredCell.name}</div>
                </Hint>)}
            </RadarChart>}
        </div>
      )}
    </Query>
  )
}