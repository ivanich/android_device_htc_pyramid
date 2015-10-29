package com.android.internal.telephony;

import android.content.Context;
import android.os.Parcel;
import android.telephony.SignalStrength;

import java.util.ArrayList;

/**
 * Provides SignalStrength correction for old HTC RIL
 */
public class HtcMsm8660RIL extends RIL {

    private final int mQANElements = 5;

    public HtcMsm8660RIL(Context context, int preferredNetworkType, int cdmaSubscription) {
        super(context, preferredNetworkType, cdmaSubscription);
    }

    public HtcMsm8660RIL(Context context, int preferredNetworkType, int cdmaSubscription, Integer instanceId) {
        super(context, preferredNetworkType, cdmaSubscription, instanceId);
    }

    protected Object
    responseOperatorInfos(Parcel p) {
        String strings[] = (String [])responseStrings(p);
        ArrayList<OperatorInfo> ret;

        if (strings.length % mQANElements != 0) {
            throw new RuntimeException(
                "RIL_REQUEST_QUERY_AVAILABLE_NETWORKS: invalid response. Got "
                + strings.length + " strings, expected multiple of " + mQANElements);
        }

        ret = new ArrayList<OperatorInfo>(strings.length / mQANElements);

        for (int i = 0 ; i < strings.length ; i += mQANElements) {
            ret.add (
                new OperatorInfo(
                    strings[i+0],
                    strings[i+1],
                    strings[i+2],
                    strings[i+3]));
        }

        return ret;
    }

    @Override
    protected Object
    responseSignalStrength(Parcel p) {
        int numInts = 12;
        int response[];

        response = new int[numInts];
        for (int i = 0 ; i < numInts ; i++) {
            if (i > 6 && i < 12) {
		//We dont have LTE so mark these as INVALID
                response[i] = SignalStrength.INVALID;
            } else {
                response[i] = p.readInt();
            }
        }

        return new SignalStrength(response[0], response[1], response[2], response[3], response[4], response[5],
                response[6], response[7],response[8], response[9], response[10], response[11], true);
    }

}
