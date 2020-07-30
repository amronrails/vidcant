import React from 'react';
import { format } from 'd3-format';
import { Query } from 'react-apollo';
import gql from 'graphql-tag';
import {
  FlexibleXYPlot,
  XAxis,
  YAxis,
  VerticalGridLines,
  HorizontalGridLines,
  LineSeries,
  Hint
} from 'react-vis';
import 'react-vis/dist/style.css';
import Radar from './Radar'

const canada_query = gql`
{
  canada {
    id
    pruid
    date
    numconf
    numtotal
    numrecover
 		numdeaths   
  }
}
`;
const kFormat = format('~s');


export default () => (
  <Query query={canada_query}>
    {(request) => (
      <div>
        {request.loading
          ? 'loading...'
          : <div style={{ width: '90%', margin: '0 auto' }}>
            <FlexibleXYPlot height={400} xType="ordinal">
              <VerticalGridLines />
              <HorizontalGridLines />
              <XAxis style={{ fontSize: 14, fontWeight: 'bold' }} />
              <YAxis tickFormat={t => kFormat(t)} tickPadding={-5} style={{ fontSize: 14, fontWeight: 'bold' }} />
              <LineSeries
                data={request.data.canada.map(
                  (el, i) => ({ x: String(el.date), y: (el.numconf) })
                )}
              />
            </FlexibleXYPlot>
          </div>
        }
        <div style={{ width: '90%', margin: '0 auto' }}>
          <Radar />
        </div>
      </div>
    )}
  </Query>
);

